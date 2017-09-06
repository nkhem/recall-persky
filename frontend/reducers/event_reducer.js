import {
  RECEIVE_NEW_EVENT,
  RECEIVE_ERRORS,
 CLEAR_ERRORS } from '../actions/event_actions';

const initialState = {
  newEvent: null,
  errors: []
};

const EventReducer = (state = initialState, action) => {
  Object.freeze(state);
  let nextState;

  switch (action.type) {
    case RECEIVE_NEW_EVENT:
      nextState = Object.assign(
        {},
        initialState,
        { newEvent: action.newEvent }
      );
      return nextState;
    case RECEIVE_ERRORS:
      nextState = Object.assign(
        {},
        initialState,
        { errors: action.errors }
      );
      return nextState;
    case CLEAR_ERRORS:
      nextState = Object.assign(
        {},
        state,
        { errors: [] }
      );
      return nextState;
    default:
      return state;
  }
};

export default EventReducer;
