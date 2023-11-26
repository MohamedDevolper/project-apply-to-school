import { RouterProvider, createBrowserRouter } from "react-router-dom";
import Layout from "./Components/Layout/Layout";
import Home from "./Components/Home/Home";
import About from "./Components/About/About";
import Apply from "./Components/ِApply/Apply";
import "slick-carousel/slick/slick.css";
import "slick-carousel/slick/slick-theme.css";
import Countact from "./Components/Countact/Countact";
import Topay from "./Components/Paymat/Paymat";
import Campus from "./Components/Campus/Campus";
import { Toaster } from "react-hot-toast";

const router =createBrowserRouter([
  {path:'/' ,element:<Layout/> ,children:[
    {index:true,element:<Home />},
    {path:'/about',element:<About />},
    {path:'/apply',element:<Apply />},
    {path:'/countact',element:<Countact />},
    {path:'/paymat',element:<Topay />},
    {path:'/campus',element:<Campus />},
  ]}
])

function App() {

  return<>
   <RouterProvider router={router}></RouterProvider>
   <Toaster/>
  </>
}

export default App;
