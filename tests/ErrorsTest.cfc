component output="false" extends="mxunit.framework.TestCase"
{
  public void function setUp(){
    errors = new LightModel.errors();
  }

  public void function should_initialize(){
    assertIsTypeOf(errors, 'LightModel.errors');
    assertIsEmptyStruct(errors.getErrors());
  }

  public void function should_add_error(){
    assertIsEmptyStruct(errors.getErrors());
    errors.add(property="test", message="This is a test error message.");
    assertEquals(StructCount(errors.getErrors()), 1);
  }

  public void function should_add_extremely_long_error(){
    var message = "This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.This is a test error message.";

    assertIsEmptyStruct(errors.getErrors());
    errors.add(property="test", message=message);
    assertEquals(StructCount(errors.getErrors()), 1);
    assertEquals(errors.getErrors()['test'][1], message);
  }

  public void function should_add_extremely_long_property_name(){
    var message = "This is a test error message.";
    var property = "test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::test::"

    assertIsEmptyStruct(errors.getErrors());
    errors.add(property=property, message=message);
    assertEquals(StructCount(errors.getErrors()), 1);
    assertEquals(errors.getErrors()[property][1], message);
  }

  public void function added_error_should_have_correct_content(){
    var property = 'testProp';
    var message = 'This is a test error message.';
    errors.add(property=property, message=message);
    results = errors.getErrors();
    assertEquals(results[property][1], message);
  }

  public void function should_retrieve_errors_by_property_name(){
    errors.add(property="testProp", message="This is test message 1.");
    errors.add(property="testProp", message="This is test message 2.");
    errors.add(property="testPropAdd", message="This is test message 3.");

    assertEquals(StructCount(errors.getErrors()), 2);
    assertEquals(ArrayLen(errors.getErrorsByProperty('testProp')), 2);
    assertEquals(errors.getErrorsByProperty('testProp')[1], "This is test message 1.");
    assertEquals(errors.getErrorsByProperty('testProp')[2], "This is test message 2.");
  }

  public void function empty_errors_should_return_empty_struct(){
    assertIsEmptyStruct(errors.getErrors());
  }

  public void function non_existing_property_in_errors_should_return_blank_array(){
    assertIsEmptyArray(errors.getErrorsByProperty('disco'));
  }

  public void function print_errors_should_return_html_when_errors_exist(){
    errors.add(property="testProp", message="This is test message 1.");
    assertTrue(Find('<div class="error_messages">', errors.printErrors()) > 0);
  }

  public void function print_errors_should_return_empty_html_string_when_empty_errors(){
    assertEquals(errors.printErrors(), '');
  }

  public void function add_errors_should_cast_number_messages_to_string(){
    errors.add(property="testProp", message=102392034);
    assertEquals(errors.getErrorsByProperty('testProp')[1], "102392034");
  }

  public void function add_errors_should_not_accept_arrays_as_messages(){
    expectException("expression");
    var testArray = [3434, '23423', 'third test messages'];
    errors.add(property="testProp", message=testArray);
  }

  public void function add_errors_should_not_accept_structs_as_messages(){
    expectException("expression");
    var testStruct = { one: 3434, two: '23423' };
    errors.add(property="testProp", message=testStruct);
  }
}
