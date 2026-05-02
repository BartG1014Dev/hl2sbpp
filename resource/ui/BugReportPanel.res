"resource/ui/BugReportPanel.res"
{
    "BugReportPanel"
    {
        "ControlName"           "Frame"
        "fieldName"             "BugReportPanel"
        "xpos"                  "c-180"
        "ypos"                  "c-200"
        "wide"                  "360"
        "tall"                  "400"
        "autoResize"            "0"
        "pinCorner"             "0"
        "visible"               "1"
        "enabled"               "1"
        "tabPosition"           "0"
        "settitlebarvisible"    "1"
        "title"                 "#SBPP_BugReport_Title"
    }

    "LblName"
    {
        "ControlName"   "Label"
        "fieldName"     "LblName"
        "xpos"          "12"
        "ypos"          "32"
        "wide"          "336"
        "tall"          "14"
        "labelText"     "#SBPP_BugReport_Name"
        "textAlignment" "west"
    }
    "Name"
    {
        "ControlName"   "TextEntry"
        "fieldName"     "Name"
        "xpos"          "12"
        "ypos"          "48"
        "wide"          "336"
        "tall"          "20"
    }

    "LblTitle"
    {
        "ControlName"   "Label"
        "fieldName"     "LblTitle"
        "xpos"          "12"
        "ypos"          "74"
        "wide"          "336"
        "tall"          "14"
        "labelText"     "#SBPP_BugReport_BugTitle"
        "textAlignment" "west"
    }
    "Title"
    {
        "ControlName"   "TextEntry"
        "fieldName"     "Title"
        "xpos"          "12"
        "ypos"          "90"
        "wide"          "336"
        "tall"          "20"
    }

    "LblAddonId"
    {
        "ControlName"   "Label"
        "fieldName"     "LblAddonId"
        "xpos"          "12"
        "ypos"          "116"
        "wide"          "160"
        "tall"          "14"
        "labelText"     "#SBPP_BugReport_AddonId"
        "textAlignment" "west"
    }
    "AddonId"
    {
        "ControlName"   "TextEntry"
        "fieldName"     "AddonId"
        "xpos"          "12"
        "ypos"          "132"
        "wide"          "160"
        "tall"          "20"
    }

    "LblVersion"
    {
        "ControlName"   "Label"
        "fieldName"     "LblVersion"
        "xpos"          "188"
        "ypos"          "116"
        "wide"          "160"
        "tall"          "14"
        "labelText"     "#SBPP_BugReport_Version"
        "textAlignment" "west"
    }
    "Version"
    {
        "ControlName"   "TextEntry"
        "fieldName"     "Version"
        "xpos"          "188"
        "ypos"          "132"
        "wide"          "160"
        "tall"          "20"
    }

    "LblDescription"
    {
        "ControlName"   "Label"
        "fieldName"     "LblDescription"
        "xpos"          "12"
        "ypos"          "160"
        "wide"          "336"
        "tall"          "14"
        "labelText"     "#SBPP_BugReport_Description"
        "textAlignment" "west"
    }
    "Description"
    {
        "ControlName"   "TextEntry"
        "fieldName"     "Description"
        "xpos"          "12"
        "ypos"          "176"
        "wide"          "336"
        "tall"          "172"
        "multiline"     "1"
        "VerticalScrollbar" "1"
    }

    "Submit"
    {
        "ControlName"   "Button"
        "fieldName"     "Submit"
        "xpos"          "180"
        "ypos"          "362"
        "wide"          "80"
        "tall"          "24"
        "labelText"     "#SBPP_BugReport_Submit"
        "command"       "submit"
        "default"       "1"
    }
    "Cancel"
    {
        "ControlName"   "Button"
        "fieldName"     "Cancel"
        "xpos"          "268"
        "ypos"          "362"
        "wide"          "80"
        "tall"          "24"
        "labelText"     "#SBPP_BugReport_Cancel"
        "command"       "cancel"
    }
}
