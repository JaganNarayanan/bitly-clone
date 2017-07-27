$(document).ready(function(){
  console.log("jQuery ready!");

  var form = $('#shortener_form')
  form.on('submit', function(formSubmissionEvent){
    formSubmissionEvent.preventDefault();
    console.log("Prevented default action!");

    // $/ajax({
    //   url: form.attr('action'),
    //   method: form.attr('method'),
    //   data: form.serialize(),
    //   dataType: 'JSON',
    //   success: function(response) {
    //     // debugger;
    //     console.log(response);
    //   }
    // });
  })
})
