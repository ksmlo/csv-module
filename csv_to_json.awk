BEGIN{
  FS=","
  json="["
}
{
  if(NR==1){
    for(i=1;i<=NF;i++){
      keys[i]=$i
    }
  }else{
    json=json sprintf(NR>2?",{":"{")
    for(i=1;i<=NF;i++){
      json=json sprintf("\"%s\":\"%s\"",keys[i],$i)
      json=json sprintf(i<NF?",":"")
    }
    json=json "}"
  }
}
END{
  json=json "]"
  print json
}
