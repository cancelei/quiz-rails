import { application } from "./application"

// Option 1: Import from @hotwired/turbo-rails
import { Turbo } from "@hotwired/turbo-rails"
// const { TurboFrames } = Turbo

// Option 2: Direct import attempt (uncomment to try)
// import { TurboFrames } from "turbo-frames"

// Option 3: Relative path import attempt (uncomment to try)
import { TurboFrames } from "../../javascript/controllers/turbo-frames"

// Option 4: Absolute path import attempt (uncomment to try)
// import { TurboFrames } from "/turbo-frames"

Turbo.StreamActions.turbo_frame = function() {
  this.targetElements.forEach(element => {
    element.src = this.getAttribute("src")
  })
}

// If TurboFrames is successfully imported, you can use it here
// console.log(TurboFrames)

import NestedFormController from "./nested_form_controller"
application.register("nested-form", NestedFormController)

import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"
eagerLoadControllersFrom("controllers", application)

// If you need to use TurboFrames in a specific way, you can do so here
// For example:
if (TurboFrames) {
  // Use TurboFrames
}

// You can also export TurboFrames if you need to use it in other files
// export { TurboFrames }
