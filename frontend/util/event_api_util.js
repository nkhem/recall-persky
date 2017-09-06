export const createNewEvent = (newEvent, contiguousTimings) => (
  $.ajax({
    method: 'POST',
    url: '/api/event',
    data: {
      newEvent,
      contiguousTimings
    }
  })
);
