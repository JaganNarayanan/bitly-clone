$(document).ready(function(){
  console.log("jQuery ready!");

  var form = $('#shortener_form')
  form.on('submit', function(formSubmissionEvent){
    formSubmissionEvent.preventDefault();
    console.log("Prevented default action!");

    $.ajax({
      url: form.attr('action'),
      method: form.attr('method'),
      data: form.serialize(),
      dataType: 'JSON',
      success: function(response) {
        // debugger;
        console.log(response);
        // debugger;
        $('tbody').append(
          "<tr>\
          <td>" + "New" + "</td>\
          <td><a href="+ response.long +">"+ response.long + "</a></td>\
          <td><a href="+ response.short + ">" + "http://localhost:9393/" + response.short + "</a></td>\
          <td style='text-align: center'>" + response.click_count + "</td>\
          </tr>"
        )
      }
    });
  })
})
