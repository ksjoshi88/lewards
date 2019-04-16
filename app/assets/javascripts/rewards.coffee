# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class LEWARDS.AdminReports
  constructor: (@container) ->
    google.charts.load("current", {packages:["corechart","bar"]});
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
          @drawDistributionChart(data.rw, 'Rewards Distribution')
          @drawComparisonChart(data.rc,'Rewards Vs Loans')
        error: (data) =>
          alert(data)
    return

  drawDistributionChart:(projectData, chartTitle) =>
    result = []
    projectData.map (m) -> delete(m.id)
    for i of projectData
      result.push [projectData[i].name, projectData[i].sum]
    result.unshift(['Product','Reward Points'])
    data = google.visualization.arrayToDataTable(result)
    options = {
      title: chartTitle,
      is3D: true,
    }
    chart = new google.visualization.PieChart(document.getElementById('rewards-distribution-container'))
    chart.draw(data, options)

  drawComparisonChart:(projectData, chartTitle) =>
    result = []
    projectData.map (m) -> delete(m.id)
    for i of projectData
      result.push [projectData[i].name, projectData[i].amount,projectData[i].rewards, ]
    result.unshift(['Product','Loan Amount','Reward Points Given'])
    data = google.visualization.arrayToDataTable(result)
    options = {
      chart: {
        title: 'Loan Type',
        subtitle: 'Loan Amount, Reward Points',
        is3D: true
      }
    }
    chart = new google.visualization.BarChart(document.getElementById('rewards-comparison-container'))
    chart.draw(data, google.charts.Bar.convertOptions(options));
