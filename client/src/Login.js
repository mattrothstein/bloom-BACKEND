import React, { Component } from 'react';
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react'
import logo from './logo.svg';
import './App.css';
import $ from 'jquery';

class Login extends Component {
  handleLogin = (e) => {
    e.preventDefault();
    $.ajax({
      type: "POST",
      url: "http://localhost:3002/auth/sign_in",
      data: {
        email: this.email.value,
        password: this.password.value
      }
    })
    .done((response, status, jqXHR) => {
      sessionStorage.setItem('user',
        JSON.stringify({
          'access-token': jqXHR.getResponseHeader('access-token'),
          'client': jqXHR.getResponseHeader('client'),
          'uid': response.data.uid
        }));
      this.props.history.push('/');
    })
  }

  render(){
    return(
      <form onSubmit={this.handleLogin.bind(this)}>
        <input name="email"/>
        <input name="password" type ="password" />
        <input type="submit" />
      </form>
    )
  }
}

export default Login;
