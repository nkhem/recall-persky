export const createNewEvent = newEvent => (
  $.ajax({
    method: 'POST',
    url: '/api/event',
    data: newEvent
  })
);
