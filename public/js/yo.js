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

          $('tbody').append("\
            <tr>\
            <td style = "text-align: center" scope="row"><%= index + 1 %></td>\
            <td><a href="<%= url.long %>"><%=url.long%> </a></td>\
            <td><a href="<%= url.short %>"><%="http://localhost:9393/" + url.short%> </a></td>
            <td style="text-align: center"><%= url.click_count %></td>
          </tr>
          )
    //   }
    // });
  })
})
