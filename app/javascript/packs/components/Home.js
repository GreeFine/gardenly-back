import React from 'react';
import { withStyles } from '@material-ui/core/styles';

import Typography from "@material-ui/core/Typography";


const styles = theme => {
  return ({

  });
};

class Home extends React.Component {
  render() {
    return (
      <div>
        <img src="https://www.jardiland.com/media/catalog/category/AdobeStock_56352889_1.jpg" />
        <Typography style={{color: 'black'}}>LE JARDIN</Typography>
      </div>
    );
  }
}

export default withStyles(styles)(Home);
