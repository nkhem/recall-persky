import * as ApiUtil from '../util/event_api_util';

export const RECEIVE_NEW_EVENT = 'RECEIVE_NEW_EVENT';
export const RECEIVE_ERRORS = 'RECEIVE_ERRORS';
export const CLEAR_ERRORS = 'CLEAR_ERRORS';

export const createNewEvent = newEvent => dispatch => {
  return ApiUtil.createNewEvent(newEvent)
    .then(newEventPromise => {
      dispatch(receiveNewEvent(newEventPromise));
    }, errors => {
      dispatch(receiveErrors(errors.responseJSON));
    });
};

export const receiveNewEvent = newEvent => {
  return {
    type: RECEIVE_NEW_EVENT,
    newEvent: newEvent,
    errors: []
  };
};

export const receiveErrors = errors => {
  return {
    type: RECEIVE_ERRORS,
    newEvent: null,
    errors: errors
  };
};

export const clearErrors = () => {
  return {
    type: CLEAR_ERRORS
  };
};
