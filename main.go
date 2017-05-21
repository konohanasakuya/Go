package main

import (
	"net/http"
	"fmt"
	"html"
)

func viewHandler(w http.ResponseWriter, r *http.Request) {
    v := r.FormValue("input_value")
	h := `
<html><head><title>Go表示ページ</title></head><body>
    <h1>勉強ページ</h1>
    <form  action="/" method="post">
        <input type="text" name="input_value">
        <input type="submit" name="送信"><br>
        入力値：` + html.EscapeString(v) + `
    </form>
    <table border="1" bordercolor=#9999FF cellspacing="0">
        <caption>データ</caption>
        <tr bgcolor=#CCCCFF>
            <th width="200">あああ</th>
            <th width="200">いいい</th>
            <th width="200">ううう</th>
        </tr>
        <tr>
            <td>データ１</td>
            <td>データ２</td>
            <td>データ３</td>
        </tr>
        <tr>
            <td>データ４</td>
            <td>データ５</td>
            <td>データ６</td>
        </tr>
        <tr>
            <td>データ７</td>
            <td>データ８</td>
            <td>データ９</td>
        </tr>
    </table>
</body></html>
`
	fmt.Fprint(w, h)
}

func main() {
	http.HandleFunc("/", viewHandler)
	http.ListenAndServe(":8080", nil)
}
