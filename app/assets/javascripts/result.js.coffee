###*
@namespace scoping into the hquery namespace
###
this.hQuery ||= {}


# =require core.coffee
###*
Observations generated by laboratories, imaging procedures, and other procedures. The scope
includes hematology, chemistry, serology, virology, toxicology, microbiology, plain x-ray,
ultrasound, CT, MRI, angiography, cardiac echo, nuclear medicine, pathology, and procedure
observations.
@class
@augments hQuery.CodedEntry
@exports Result as hQuery.Result 
###
class hQuery.Result extends hQuery.CodedEntry
  constructor: (@json) ->
    super(@json)
  

  ###*
  ASTM CCR defines a restricted set of required result Type codes (see ResultTypeCode in section 7.3
  Summary of CCD value sets), used to categorize a result into one of several commonly accepted values
  (e.g. Hematology, Chemistry, Nuclear Medicine).
  @returns {CodedValue}
  ###
  resultType: -> this.type()
   
  ###*
  A status from the HL7 ActStatusNormal vocabulary
  @returns {String}
  ###
  status: -> @json['status']

  ###*
  Returns the value of the result. This will return an object. The properties of this
  object are dependent on the type of result.
  ###
  value: -> @json['value']

  ###*
  @returns {CodedValue}
  ###
  interpretation: -> new hQuery.CodedValue @json['interpretation'].code, @json['interpretation'].codeSystem
  
  ###*
  @returns {String}
  ###
  referenceRange: -> @json['referenceRange']
  
  ###*
  @returns {String}
  ###
  comment: -> @json['comment']
  