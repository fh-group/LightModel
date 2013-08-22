<!---
// LightModel -- We've seen the light with lite. Get it? Oh I give up.
//
// Components will be reponsible for their own persistance but will gain
// abilities such as setting errors and adding validation methods.
//
// Available Validations:
//  + LengthOf
//  + PresenceOf
//  + NumericalityOf
//  + FormatOf
//  + ConfirmationOf
--->
component output="false" accessors="true" hint="I am the base model."
{
  this.errors = '';

  property name="id" type="numeric" getter="true" setter="true" default="-1";

  // If `init` needs to be overridden in models, remember to call SUPER.init();
  // Otherwise all model functionality will not be available.
  public any function init(numeric id, any obj, required callFillById=false)
  {
    if(StructKeyExists(arguments, 'id'))
      this.setId(arguments.id);

    if(StructKeyExists(arguments, 'obj'))
      this.setProperties(obj);

    this.errors = new LightModel.errors();

    // This is so stupid. Really wish I had a class methods which 
    // would be able to contain logic for obvious class logic instead
    // of specific instance logic.
    if(arguments.callFillById)
      this.fillById();

    return this;
  }

  // Utility methods used across multiple parts of the model
  // or a place methods with no specific purpose.
  include 'utilities.cfm';

  // Responsible for all actions related to building the object
  // from other objects or general initialization type behavior.
  include 'initialization.cfm';

  // Handles all logic related to serializing the model to 
  // other data formats such as JSON and XML.
  include 'serialization.cfm';

  // Everyone loves validation right? Well, this handles the
  // validation of the properties for the model.
  include 'validation.cfm';
}
