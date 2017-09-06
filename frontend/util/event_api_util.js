export const createNewEvent = (newEvent, contiguousTimings) => (
  $.ajax({
    method: 'POST',
    url: '/api/event',
    newEvent,
    contiguousTimings
  })
);
