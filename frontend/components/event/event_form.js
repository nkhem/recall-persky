import React from 'react';
import { connect } from 'react-redux';

import { createNewEvent, clearErrors } from '../../actions/event_actions';

import ErrorMsgs from '../error_msgs';

class EventForm extends React.Component {
  constructor(props){
    super(props);

    this.state = {
      newEvent: {
        title: '',
        street_address1: '',
        street_address2: '',
        city: '',
        event_url: '',
        img_url: '',
      },
      contiguousTimings: [] // array of start_datetime/end_datetime pairs. Ex: [[start_datetime, end_datetime], ...]
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.updateEvent = this.updateEvent.bind(this);
  }

  componentWillMount() {
    this.props.clearErrors();
  }

  handleSubmit(e) {
		e.preventDefault();
    console.log("handleSubmit, this.state:", this.state);
		this.props.processForm(this.state.newEvent, this.state.contiguousTimings)
      .then( () => {
        this.props.clearErrors();
      });

    this.setState({
      newEvent: {
        title: '',
        street_address1: '',
        street_address2: '',
        city: '',
        event_url: '',
        img_url: '',
      },
      contiguousTimings: []
    });
	}

  updateEvent(field) {
    return e => {
      const nextState = Object.assign(
        {},
        this.state
      );
      nextState.newEvent[field] = e.currentTarget.value;
      this.setState(nextState);
    };
  }


  render() {
    return (
      <div>
  			<div className='main-content'>
          <h3>{this.props.formType}</h3>
          <ErrorMsgs id='new-event-errors' errors={this.props.errors} />
  				<form onSubmit={this.handleSubmit} id="new-session-form">
  					<input type="text"
  						value={this.state.newEvent.title}
  						onChange={this.updateEvent("title")}
              placeholder='title' />

  					<input type="text"
  						value={this.state.newEvent.street_address1}
  						onChange={this.updateEvent("street_address1")}
              placeholder='street_address1' />

  					<input type="text"
  						value={this.state.newEvent.city}
  						onChange={this.updateEvent("city")}
              placeholder='city' />

            <br/>

  					<input type="submit" value="Create Event" />
  				</form>
  			</div>
      </div>
		);
  }

}

const mapStateToProps = (state) => {
  return {
    loggedIn: Boolean(state.session.currentUser),
    errors: state.session.errors
  };
};

const mapDispatchToProps = (dispatch, state) => {
  return {
    clearErrors: () => dispatch(clearErrors()),
    processForm: (newEvent, contiguousTimings) => dispatch(createNewEvent(newEvent, contiguousTimings))
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(EventForm);
