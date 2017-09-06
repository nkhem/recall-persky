import React from 'react';
import { connect } from 'react-redux';

import { logout } from '../actions/session_actions';
import Header from './header';
import EventForm from './event/event_form';

class Home extends React.Component {

  render() {
    return (
      <div id='home' className='main-content'>
        <Header
          loggedIn={this.props.loggedIn}
          logout={ this.props.logout } />
        <h1>Recall Persky Volunteer Portal</h1>
        <EventForm />
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
    logout: () => dispatch(logout())
  };
};

export default connect(mapStateToProps, mapDispatchToProps)(Home);
