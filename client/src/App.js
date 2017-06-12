import React, { Component } from 'react';
import Entity from './Entity';
import Login from './Login';
import { Container, Header, Segment, Button, Icon, Dimmer, Loader, Divider } from 'semantic-ui-react';
import logo from './logo.svg';
import './App.css';

class App extends Component {
  render(){
    return(
      <div>
        <Login />
        <Entity />
      </div>
    );
  }
}


export default App;
