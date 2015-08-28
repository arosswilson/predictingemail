$(document).ready(function() {
  $('#emailprediction').on('submit', function(event){
    event.preventDefault();
    var $submissiondata = $(event.target).serialize();
    $.ajax({
      type: 'POST',
      url: '/emailprediction',
      data: $submissiondata
    })
    .done(function(response){
      $('#predictionresponse').remove();
      $('#mainpage').append(response);
      $('#namefield').val('');
      $('#urlfield').val('');
    })
    .fail(function(){
      console.log('error');
    })
  })
});