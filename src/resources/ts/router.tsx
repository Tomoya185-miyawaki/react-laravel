import React, { useEffect } from "react"
import {
    BrowserRouter,
    Switch,
    Route,
    Link
} from "react-router-dom";
import TaskPage from "./pages/tasks";
import HelpPage from "./pages/help";
import LoginPage from "./pages/login";
import axios from "axios";

const Router = () => {
    useEffect(() => {
        axios.post('/api/login', {
            email: 'admin@example.com',
            password: 'password'
        }).then(response => {
            console.log(response)
        })
    }, [])
    return (
        <BrowserRouter>
            <div>
                <header className="global-head">
                    <ul>
                        <li><Link to="/">ホーム</Link></li>
                        <li><Link to="/help">ヘルプ</Link></li>
                        <li><Link to="/login">ログイン</Link></li>
                    </ul>
                </header>
                <Switch>
                    <Route path="/help">
                        <HelpPage />
                    </Route>
                    <Route path="/login">
                        <LoginPage />
                    </Route>
                    <Route path="/">
                        <TaskPage />
                    </Route>
                </Switch>
            </div>
        </BrowserRouter>
    )
}

export default Router
