import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  return (
    <ul>
    {
      giphys.map(el => <GiphysIndexItem giphy={el}/>)
    }
    </ul>
  );
};

export default GiphysIndex;
