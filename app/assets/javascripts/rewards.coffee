# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class LEWARDS.AdminReports
  constructor: (@container) ->
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(@getRewardsDistribution);

#  init: ->
#    @bindEvents()
#
#  bindEvents: ->
##    @container.find('#project-id-selector').change (event) =>
##      @getProjectStatus($(event.target).val(),$(event.target).find('option:selected').text())

  getRewardsDistribution:() =>
    $.ajax
        type: "GET"
        url: '/get_rewards_distribution/'
        success: (data) =>
          @drawChart(data, 'Rewards Distribution')
        error: (data) =>
          alert(data)
    return

  drawChart:(projectData, chartTitle) =>
    result = []
    projectData.map (m) -> delete(m.id)
    for i of projectData
      result.push [projectData[i].name, projectData[i].sum]
    result.unshift(['Project','Rewards'])
    data = google.visualization.arrayToDataTable(result)
    options = {
      title: chartTitle,
      is3D: true,
    }
    chart = new google.visualization.PieChart(document.getElementById('rewards-distribution-container'))
    chart.draw(data, options)
