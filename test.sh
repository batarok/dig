#!/bin/bash
echo hello | { read str
  echo $str
}
