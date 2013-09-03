component name="LengthValidator" extends="Validator" output="false" accessors="true" hint="I validate that things are of a certain length."
{
  variables.options = StructNew();

  public void function init(struct options){
    variables.options.AllowNull = true;
    variables.options.message = '';
    StructAppend(variables.options, arguments.options, true);
  }

  public boolean function run(){
    var result = false;
    var propertyValue = '';
    var message = '';

    if(variables.options.comparison == '')
      throw(type="ArgumentError", message="Comparison has not been set.");

    propertyValue = this.getTarget()["get#capitalize(this.getProperty())#"]();

    if(!IsDefined('propertyValue')){
      if(variables.options.AllowNull){
        this.getTarget().errors.add(property="#this.getProperty()#", message="#this.getProperty()# does not exist.");
        return result;
      }else{
        throw(type="ArgumentError", message="#this.getProperty()# can not be null.");
      } 
    }

    switch(variables.options.comparison){
      case "max":
        result = Len(propertyValue) <= variables.options.length;
        message = (variables.options.message != '') ? variable.options.message : "#this.getProperty()# is greater than the maximum of #variables.options.length#";
        break;
      case "min":
        result = Len(propertyValue) >= variables.options.length;
        message = (variables.options.message != '') ? variable.options.message : "#this.getProperty()# is less than the minimum of #variables.options.length#";
        break;
      case "within":
        result = (variables.options.minimum <= Len(propertyValue) && Len(propertyValue) <= variables.options.maximum);
        message = (variables.options.message != '') ? variable.options.message : "#this.getProperty()# is not between #variables.options.minimum# and #variables.options.maximum#";
        break;
      case "equals":
        result = Len(propertyValue) == variables.options.length;
        message = (variables.options.message != '') ? variable.options.message : "#this.getProperty()# does not equal #variables.options.length#";
        break;
      default:
        result = Len(propertyValue) > variables.options.length;
        message = (variables.options.message != '') ? variable.options.message : "#this.getProperty()# is not greater than #variables.options.length#";
        break;
    }

    if(!result){
      this.getTarget().errors.add(property="#this.getProperty()#", message=message);
    }

    return result;
  }
}
