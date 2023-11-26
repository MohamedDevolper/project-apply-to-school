import React from 'react';
import ReactDOM from 'react-dom/client';

import  './../node_modules/bootstrap/dist/css/bootstrap.min.css'
import  './../node_modules/bootstrap/dist/js/bootstrap.bundle'

import '@fortawesome/fontawesome-free/css/all.min.css'

import 'jquery/dist/jquery'
import './index.css';
import App from './App';


const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <App />
);


