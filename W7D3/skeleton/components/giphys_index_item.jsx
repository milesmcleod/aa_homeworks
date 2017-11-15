import React from 'react';

const GiphysIndexItem = ({ giphy }) => (
  <li className='giphy-li'>
    <img src={giphy.images.fixed_height.url}></img>
  </li>
);

export default GiphysIndexItem;
