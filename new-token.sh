tokenaddrvar=$(spl-token create-token --url https://api.devnet.solana.com)
removepsace="$(echo -e "${tokenaddrvar}" | tr -d '[:space:]')"
token=$(sed -e 's/.*token\(.*\)Sign.*/\1/' <<< "$removepsace")

accountaddrvar=$(spl-token create-account $token --url https://api.devnet.solana.com)
removespace="$(echo -e ${accountaddrvar} | tr -d '[:space:]')"
accountaddress=$(sed -e 's/.*account\(.*\)Sign.*/\1/' <<< "$removespace")
echo "Account Address=> $accountaddress"

spl-token mint $token 10 --url https://api.devnet.solana.com
balance=$(spl-token balance $token --url https://api.devnet.solana.com)
echo "Balance=> $balance"
spl-token supply $token --url https://api.devnet.solana.com

spl-token authorize $accountaddress mint –disable --url https://api.devnet.solana.com
spl-token burn $accountaddress 1 --url https://api.devnet.solana.com
finalbalance=$(spl-token balance $token --url https://api.devnet.solana.com)
echo "Final balance=> $finalbalance"