component name="FormatValidator" extends="Validator" output="false" accessors="true" hint="I validate properties to make sure they are in a correct format."
{
  variables.options = StructNew();
  variables.options.AllowNull = true;
  variables.options.regEx = '';
  variables.options.type = '';

  public void function init(struct options = {}){
    StructAppend(variables.options, arguments.options, true);
  }

  public boolean function run(){
    var result = false;
    var propertyValue = '';
    var message = '#this.getProperty()# is not valid.';

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
      this.getTarget().errors.add(property=this.getProperty(), message=message);
    }else{
      result = true;
    }

    return result;
  }
}
