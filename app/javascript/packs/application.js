// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"
import "../bootstrap_js_files.js"
import "select2"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

window.jQuery = $;
window.$ = $;

$(function() {
  $(".multiple-select2").select2();

  $(".modal-form").on("show.bs.modal", function(event) {
    var button = event.relatedTarget;
    var object = JSON.parse(button.getAttribute("data-bs-object"));
    var form = $("#edit_destination");
    form.find("#destination_name").val(object.name);
    form.find("#edit_destination_references").val(object.references);
    form.find("#edit_destination_categories").val(object.categories);
    $(".multiple-select2").trigger("change");
    form.attr("action", form.attr("action").replace(/(\d+)$/g, object.id));
  });
});
