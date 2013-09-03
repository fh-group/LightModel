component name="PresenceValidator" extends="Validator" output="false" accessors="true" hint="I validate that things are of a certain length."
{
  variables.options = StructNew();

  public void function init(struct options){
    variables.options.message = "#this.getProperty()# does not exist.";
    StructAppend(variables.options, arguments.options, true);
  }

  public boolean function run(){
    var propertyValue = '';
    var result = false;

    propertyValue = this.getTarget()["get#capitalize(this.getProperty())#"]()

    if(IsDefined('propertyValue')){
      result = true;
    }else{
      this.getTarget().errors.add(property="#this.getProperty()#", message=variables.options.message);
    }

    return result;
  }
}
