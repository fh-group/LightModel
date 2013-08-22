component name="Validator" implements="ValidatorInterface" output="false" accessors="true" hint="I am the base validator."
{
  property any target;
  property string property;
  property string result=false;

  // Should be overriden in child component
  public boolean function run(){
    throw(type="NotImplemented", message="Method Not Yet Implemented.");
  }

  private string function capitalize(string word){
    return UCase(left(arguments.word,1)) & right(arguments.word,len(arguments.word)-1)
  }
}
