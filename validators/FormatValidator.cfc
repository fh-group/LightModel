component name="FormatValidator" extends="Validator" output="false" accessors="true" hint="I validate properties to make sure they are in a correct format."
{
  variables.options = StructNew();

  public void function init(struct options = {}){
    variables.options.regEx = '';
    variables.options.type = '';
    variables.options.AllowNull = true;
    variables.options.message = '#this.getProperty()# is not valid.';
    StructAppend(variables.options, arguments.options, true);
  }

  public boolean function run(){
    var result = false;
    var propertyValue = '';

    propertyValue = this.getTarget()["get#capitalize(this.getProperty())#"]();

    if(!IsDefined('propertyValue')){
      if(variables.options.AllowNull){
        this.getTarget().errors.add(property="#this.getProperty()#", message="#this.getProperty()# does not exist.");
        return result;
      }else{
        throw(type="ArgumentError", message="#this.getProperty()# can not be null.");
      } 
    }

    if (
        ((StructKeyExists(variables.options, 'type') && Len(variables.options.type) && !IsValid(variables.options.type, propertyValue))
        || (StructKeyExists(variables.options, 'regEx') && Len(variables.options.regEx) && !REFindNoCase(variables.options.regEx, propertyValue) > 0))
    ){
      this.getTarget().errors.add(property=this.getProperty(), message=variables.options.message);
    }else{
      result = true;
    }

    return result;
  }
}
