component output="false" extends="mxunit.framework.TestCase"
{
  public void function setUp(){
    BasicModel = new _assets.BasicModel();
  }

  public void function should_initialize(){
    assertIsTypeOf(BasicModel, 'LightModel.model');
  }

  public void function should_have_errors_object(){
    assertTrue(StructKeyExists(BasicModel, 'errors'));
  }
}
