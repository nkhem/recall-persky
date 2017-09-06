import React from 'react';
import { connect } from 'react-redux';

import { createNewEvent, clearErrors } from '../../actions/event_actions';

import Header from '../header';
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
        public_details: ''
      },
      contiguousTimings: [] // array of start_datetime/end_datetime pairs. Ex: [[start_datetime, end_datetime], ...]
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.redirectIfLoggedIn = this.redirectIfLoggedIn.bind(this);
  }

  componentWillMount() {
    this.props.clearErrors();
  }

  handleSubmit(e) {
		e.preventDefault();
		this.props.processForm({newEvent: this.state})
      .then( () => {
        this.props.clearErrors();
        this.redirectIfLoggedIn();
      });

//     this.setState({
//       f_name: '',
//       l_name: '',
//       email: '',
//       phone_number: '',
//       password: ''
//     });
// 	}
//
//   redirectIfLoggedIn(){
//     if(this.props.loggedIn){
//       this.props.router.push("/");
//     }
//   }
//
//   update(field) {
//     return e => this.setState({
//       [field]: e.currentTarget.value
//     });
//   }
//
//   render() {
//     return (
//       <div>
//         <Header
//           hideEventBtns={ true }
//           loggedIn={this.props.loggedIn} />
//   			<div className='main-content'>
//           <h3>{this.props.formType}</h3>
//           <ErrorMsgs id='session-errors' errors={this.props.errors} />
//   				<form onSubmit={this.handleSubmit} id="new-session-form">
//   					<input type={`${this.props.formType === 'login' ? 'hidden': 'text'}`}
//   						value={this.state.f_name}
//   						onChange={this.update("f_name")}
//               placeholder='First name' />
//
//             <br/>
//
//             <input type={`${this.props.formType === 'login' ? 'hidden': 'text'}`}
//   						value={this.state.l_name}
//   						onChange={this.update("l_name")}
//               placeholder='Last name' />
//
//             <br/>
//
//             <input type={`${this.props.formType === 'login' ? 'hidden': 'text'}`}
//   						value={this.state.phone_number}
//   						onChange={this.update("phone_number")}
//               placeholder='Phone Number' />
//
//             <br/>
//
//   					<input type="text"
//   						value={this.state.email}
//   						onChange={this.update("email")}
//               placeholder='Email' />
//
//   					<br/>
//
//   					<input type="password"
//   						value={this.state.password}
//   						onChange={this.update("password")}
//               placeholder='Password' />
//
//   					<br/>
//
//   					<input type="submit" value={this.props.formType === 'login' ? 'Log in' : 'Sign up'} />
//   				</form>
//   			</div>
//       </div>
// 		);
//   }
//
// }
//
// const mapStateToProps = (state) => {
//   return {
//     loggedIn: Boolean(state.session.currentUser),
//     errors: state.session.errors
//   };
// };
//
// const mapDispatchToProps = (dispatch, state) => {
//   const pathname = state.location.pathname;
//   const formType = (pathname.substring(0,1) === '/') ? pathname.slice(1) : pathname ;
//   const processForm = (formType === 'login') ? login : signup;
//
//   return {
//     clearErrors: () => dispatch(clearErrors()),
//     processForm: user => dispatch(processForm(user)),
//     formType: formType
//   };
// };

export default connect(mapStateToProps, mapDispatchToProps)(EventForm);
