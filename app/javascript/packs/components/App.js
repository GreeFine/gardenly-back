import React from 'react';
import ReactDOM from 'react-dom';
import { MuiThemeProvider, createMuiTheme } from '@material-ui/core/styles';
import CssBaseline from '@material-ui/core/CssBaseline';
import { ApolloProvider, withApollo, Query } from 'react-apollo';
import { createHttpLink } from 'apollo-link-http';
import blue from '@material-ui/core/colors/blue';
import deepPurple from '@material-ui/core/colors/deepPurple';
import teal from '@material-ui/core/colors/teal';

import apolloClient from '../apolloClient';
import AppRouter from './AppRouter';
import themeSelector from '../themeSelector';

const makeTheme = (type) => {
  const background = type === 'dark' ? { paper: '#222', default: '#333' } : {};

  return (
    createMuiTheme({
      typography: {
        useNextVariants: true,
      },
      palette: {
        background,
        primary: {
          main: '#3492ca'
        },
        secondary: {
          main: '#ff6f00'
        },
        type: type
      },
    })
  );
}

class App extends React.Component {
  state = {
    loaded: false
  }

  componentDidMount() {

  }

  render() {
    if (!this.state.loaded) {
      //return (null);
    }

    return (
      <React.Fragment>
        <CssBaseline />
        <AppRouter />
      </React.Fragment>
    )
  }
}

const ConnectedApp = withApollo(App);

export default class AppBootstrap extends React.Component {
  render() {
    return (
      <ApolloProvider client={apolloClient}>
        <MuiThemeProvider theme={makeTheme()}>
          <ConnectedApp />
        </MuiThemeProvider>
      </ApolloProvider>
    );
  }
}
