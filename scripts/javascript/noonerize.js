// get two numbers, swap first digit and subtract them
function noonerize(numbers) {
        console.log(numbers);
        let str = String(numbers);
        let [n1,n2] = str.split(",");
        let i = 0;
        while ("1234567890".includes(n1[i])) {
                i++;
        }
        let [pren1,postn1] = [n1.substr(0,i), n1.substr(i)];
        i = 0;
        while ("1234567890".includes(n1[i])) {
                i++;
        }
        let [pren2,postn2] = [n2.substr(0,i),n2.substr(i)];
        str = [pren2+postn1,pren1+postn2];
        let nnumbers = [0,0];
        nnumbers[0] = Number(str[0]);
        nnumbers[1] = Number(str[1]);
        console.log(nnumbers);
}
noonerize([12,34]); // -> 18
