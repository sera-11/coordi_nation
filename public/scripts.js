/*!
* Start Bootstrap - Scrolling Nav v5.0.6 (https://startbootstrap.com/template/scrolling-nav)
* Copyright 2013-2023 Start Bootstrap
* Licensed under MIT (https://github.com/StartBootstrap/startbootstrap-scrolling-nav/blob/master/LICENSE)
*/
//
// Scripts
// 

window.addEventListener('DOMContentLoaded', event => {

  // Activate Bootstrap scrollspy on the main nav element
  const mainNav = document.body.querySelector('#mainNav');
  if (mainNav) {
      new bootstrap.ScrollSpy(document.body, {
          target: '#mainNav',
          rootMargin: '0px 0px -40%',
      });
  };

  // Collapse responsive navbar when toggler is visible
  const navbarToggler = document.body.querySelector('.navbar-toggler');
  const responsiveNavItems = [].slice.call(
      document.querySelectorAll('#navbarResponsive .nav-link')
  );
  responsiveNavItems.map(function (responsiveNavItem) {
      responsiveNavItem.addEventListener('click', () => {
          if (window.getComputedStyle(navbarToggler).display !== 'none') {
              navbarToggler.click();
          }
      });
  });

});


//task

$(function() {
    $(".draggable").draggable({
      revert: true,
      cursor: "move"
    });
  
    $(".droppable-column").droppable({
      accept: ".draggable",
      drop: function(event, ui) {
        var taskId = ui.draggable.data("task-id");
        var columnId = $(this).attr("id");
  
        // Construct the URL with organization ID and task ID
        var organizationId = $(this).closest('.row').data('organization-id');
        var url = "/organizations/" + organizationId + "/tasks/" + taskId;
  
        // Send an AJAX request to update the task status
        $.ajax({
          method: "PUT",
          url: url,
          data: { status: columnId },
          success: function(response) {
            console.log("Task status updated successfully!");
            // Optionally, update the UI to reflect the new task status
            ui.draggable.appendTo($(event.target).find(".draggable-container"));
          },
          error: function(xhr, status, error) {
            console.error("Error updating task status:", error);
          }
        });
      }
    });
  });
  