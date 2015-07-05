// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_tree .
$(function() {
  // Handler for .ready() called.
  var data = [
    {
        value: gon.target_status[0],
        color:"#F7464A",
        highlight: "#FF5A5E",
        label: "Down Targets"
    },
    {
        value: gon.target_status[1],
        color: "#55CA30",
        highlight: "#9ACD32",
        label: "Up Targets"
    }

]
  var ctx = $("#myChart").get(0).getContext("2d");
  var myDoughnutChart = new Chart(ctx).Doughnut(data,{});


});