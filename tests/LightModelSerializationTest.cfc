component output="false" extends="mxunit.framework.TestCase"
{
  public void function setUp(){
    BasicModel = new _assets.BasicModel();
  }

  public void function to_json_returns_correct_json(){
    BasicModel.setName('test').setPassword('test').setPasswordConfirmation('test');
    var json_correct = { id: '0', name: 'test', password: 'test', passwordConfirmation:'test' };
    var json = BasicModel.to_json();
    json = deserializeJSON(json);
    assertTrue(json_correct.Equals(json));
  }

  public void function to_struct_returns_correct_struct(){
    BasicModel.setName('test').setPassword('test').setPasswordConfirmation('test');
    var struct_correct = { id: '0', name: 'test', password: 'test', passwordConfirmation:'test' };
    var struct = BasicModel.to_struct();
    assertTrue(struct_correct.Equals(struct));
  }
}
