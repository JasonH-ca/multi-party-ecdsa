params=`cat params`
regex=\"parties\":\"\(.*\)\",\"threshold\":\"\(.*\)\"
[[ $params =~ $regex ]]

n=${BASH_REMATCH[1]}
t=${BASH_REMATCH[2]}

echo "$0: Multi-party ECDSA parties:$n threshold:$t"
#clean
sleep 1

echo "sign"

for i in $(seq 1 $((t+1)));
do
echo "signing for client $i out of $((t+1))"
./gg18_sign_client http://127.0.0.1:8001 keys$i.store "KZen Networks" &

sleep 2
done

