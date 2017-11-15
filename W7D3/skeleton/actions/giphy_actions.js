import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = 'RECEIVE_SEARCH_GIPHYS';

export const receiveSearchGiphys = (giphys) => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  };
};

export const fetchSearchGiphys = (term) => (dispatch) => {
  APIUtil.fetchSearchGiphys(term)
  .then(response => dispatch(receiveSearchGiphys(response.data)));
};
