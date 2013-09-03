component name="NumericalityValidator" extends="Validator" output="false" accessors="true" hint="I validate that properties are numbers."
{
  variables.options = StructNew();

  public void function init(struct options){
    variables.options.AllowNull = true;
    variables.options.message = "#propertyValue# is not a valid number based on validation.";
    StructAppend(variables.options, arguments.options, true);
  }

  public boolean function run(){
    var result = false;
    var propertyValue = '';
    var message = '';

    propertyValue = this.getTarget()["get#capitalize(this.getProperty())#"]();

    if(!IsDefined('propertyValue')){
      if(variables.options.AllowNull){
        this.getTarget().errors.add(property="#this.getProperty()#", message="#this.getProperty()# does not exist.");
        return result;
      }else{
        throw(type="ArgumentError", message="#this.getProperty()# can not be null.");
      } 
    }

    // Credit to CFWheels for the validation below.
    if (
      !IsNumeric(propertyValue)
      || (StructKeyExists(variables.options, 'onlyInteger') && variables.options.onlyInteger && Round(propertyValue) != propertyValue)
      || (StructKeyExists(variables.options, 'greaterThan') && IsNumeric(variables.options.greaterThan) && propertyValue lte variables.options.greaterThan)
      || (StructKeyExists(variables.options, 'greaterThanOrEqualTo') && IsNumeric(variables.options.greaterThanOrEqualTo) && propertyValue lt variables.options.greaterThanOrEqualTo)
      || (StructKeyExists(variables.options, 'equalTo') && IsNumeric(variables.options.equalTo) && propertyValue neq variables.options.equalTo)
      || (StructKeyExists(variables.options, 'lessThan') && IsNumeric(variables.options.lessThan) && propertyValue gte variables.options.lessThan)
      || (StructKeyExists(variables.options, 'lessThanOrEqualTo') && IsNumeric(variables.options.lessThanOrEqualTo) && propertyValue gt variables.options.lessThanOrEqualTo)
      || (StructKeyExists(variables.options, 'odd') && IsBoolean(variables.options.odd) && variables.options.odd && !BitAnd(propertyValue, 1))
      || (StructKeyExists(variables.options, 'even') && IsBoolean(variables.options.even) && variables.options.even && BitAnd(propertyValue, 1))
    ){
      this.getTarget().errors.add(property="#this.getProperty()#", message=variables.options.message);
    }else{
      result = true;
    }

    return result;
  }
}
