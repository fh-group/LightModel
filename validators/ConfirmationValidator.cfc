component name="ConfirmationValidator" extends="Validator" output="false" accessors="true" hint="I validate that things are of a certain length."
{
  variables.options = StructNew();

  public void function init(struct options){
    variables.options.AllowNull = true;
    variables.options.message = "#this.getProperty()# does not match it's confirmation.";
    StructAppend(variables.options, arguments.options, true);
  }

  public boolean function run(){
    var result = false;
    var propertyValue = '';
    var confirmationProperty = this.getProperty() & "Confirmation";

    propertyValue = this.getTarget()["get#capitalize(this.getProperty())#"]()
    confirmationPropertyValue = this.getTarget()["get#capitalize(confirmationProperty)#"]()

    if(!IsDefined('propertyValue')){
      if(variables.options.AllowNull){
        this.getTarget().errors.add(property="#this.getProperty()#", message="#this.getProperty()# does not exist.");
        return result;
      }else{
        throw(type="ArgumentError", message="#this.getProperty()# can not be null.");
      } 
    }

    if(!IsDefined('confirmationPropertyValue')){
      if(variables.options.AllowNull){
        this.getTarget().errors.add(property="#confirmationProperty#", message="#confirmationProperty# does not exist.");
        return result;
      }else{
        throw(type="ArgumentError", message="#confirmationProperty# can not be null.");
      } 
    }

    // Probably needs to be flushed out to work with Arrays / Structs and complex structures.
    // I doubt the == will work and most things don't have a .equals method to call.
    result = propertyValue == confirmationPropertyValue;

    if(!result){
      this.getTarget().errors.add(property="#this.getProperty()#", message=variables.options.message);
    }

    return result;
  }
}
