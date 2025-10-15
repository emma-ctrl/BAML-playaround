// Define structured data model for patent inventions
class PatentInvention {
  technical_field string
  problem_solved string
  solution_overview string
  key_features string[]
  components_and_interactions string[]
  process_description string
}

// Function to extract structured patent information from summary text
function ExtractPatentInvention(patent_summary: string) -> PatentInvention {
  client CustomSonnet4
  prompt #"
    Extract structured information from the following patent summary.

    {{ patent_summary }}

    {{ ctx.output_format }}
  "#
}

// Test with laundry appliance heat pump patent
test filterless_dryer_patent {
  functions [ExtractPatentInvention]
  args {
    patent_summary #"
      BACKGROUND

      The device is in the field of laundry appliances, and more specifically, laundry appliances having a heat pump system for operating a filterless air-handling system.

      SUMMARY

      In at least one aspect, a laundry appliance includes a blower that directs process air along an airflow path. A condensing heat exchanger heats the process air to define heated process air. A drum receives the heated process air to dry laundry. A pump directs fluid along a fluid path. An evaporating heat exchanger cools the fluid to define a cooled fluid. A refrigerant circuit directs a refrigerant between the condensing and evaporating heat exchangers. A shower area in which the cooled fluid is showered through the heated process air after the heated process air exits the drum to wash particulate matter out of the heated process air. The pump directs the fluid towards the evaporating heat exchanger in order to cool the fluid, and directs the cooled fluid to the shower area.

      In at least another aspect, a thermal exchange system for an appliance includes a first heat exchange loop having condensing and evaporating heat exchangers. A second heat exchange loop heats process air at the condensing heat exchanger for delivery through a drum and a shower area, sequentially. A third heat exchange loop cools a fluid at the evaporating heat exchanger for delivery to the shower area. The shower area is defined by an interaction of the fluid with the process air leaving the drum to wash particulate matter from the process air leaving the drum and to cool and dehumidify the process air leaving the drum.

      In at least another aspect, an air-handling system for an appliance includes an airflow path that directs process air through a condensing heat exchanger to define heated process air that is delivered through a rotating drum. A fluid path selectively directs a fluid through an evaporating heat exchanger to define cooled fluid, wherein the evaporating heat exchanger is in thermal communication with the condensing heat exchanger. A shower area defined by an intersection of the airflow path and the fluid path. The cooled fluid is delivered through the heated process air within the fluid shower to cool and dehumidify the heated process air and warm the cooled fluid. The cooled fluid washes particulate matter from the heated process air. The heated process air increases a fluid temperature of the cooled fluid.

      These and other features, advantages, and objects of the present device will be further understood and appreciated by those skilled in the art upon studying the following specification, claims, and appended drawings.
    "#
  }
}
