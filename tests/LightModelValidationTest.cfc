component output="false" extends="mxunit.framework.TestCase"
{
  public void function validation_on_blank_model_should_be_true(){
    var bm = new _assets.BasicModel();
    assertTrue(bm.validate());
  }

  public void function validates_format_should_validate_coldfusion_types(){
    ValModel = new _assets.ValidationModel();
  }
}
