node {
  name: "conv2d_1_input"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14213381707668304
      }
    }
  }
}
node {
  name: "conv2d_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 9662317
    }
  }
}
node {
  name: "conv2d_1/random_uniform/sub"
  op: "Sub"
  input: "conv2d_1/random_uniform/max"
  input: "conv2d_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1/random_uniform/mul"
  op: "Mul"
  input: "conv2d_1/random_uniform/RandomUniform"
  input: "conv2d_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1/random_uniform"
  op: "Add"
  input: "conv2d_1/random_uniform/mul"
  input: "conv2d_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1/kernel/Assign"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "conv2d_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1/kernel/read"
  op: "Identity"
  input: "conv2d_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
}
node {
  name: "conv2d_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_1/bias/Assign"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "conv2d_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1/bias/read"
  op: "Identity"
  input: "conv2d_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
}
node {
  name: "conv2d_1/convolution/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_1/convolution"
  op: "Conv2D"
  input: "conv2d_1_input"
  input: "conv2d_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_1/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_1/convolution"
  input: "conv2d_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "activation_1/Relu"
  op: "Relu"
  input: "conv2d_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_1/MaxPool"
  op: "MaxPool"
  input: "activation_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0833333358168602
      }
    }
  }
}
node {
  name: "conv2d_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 8921524
    }
  }
}
node {
  name: "conv2d_2/random_uniform/sub"
  op: "Sub"
  input: "conv2d_2/random_uniform/max"
  input: "conv2d_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/random_uniform/mul"
  op: "Mul"
  input: "conv2d_2/random_uniform/RandomUniform"
  input: "conv2d_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/random_uniform"
  op: "Add"
  input: "conv2d_2/random_uniform/mul"
  input: "conv2d_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2/kernel/Assign"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "conv2d_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2/kernel/read"
  op: "Identity"
  input: "conv2d_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
}
node {
  name: "conv2d_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_2/bias/Assign"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "conv2d_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2/bias/read"
  op: "Identity"
  input: "conv2d_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
}
node {
  name: "conv2d_2/convolution/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_2/convolution"
  op: "Conv2D"
  input: "max_pooling2d_1/MaxPool"
  input: "conv2d_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_2/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_2/convolution"
  input: "conv2d_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "activation_2/Relu"
  op: "Relu"
  input: "conv2d_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_2/MaxPool"
  op: "MaxPool"
  input: "activation_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
}
node {
  name: "conv2d_3/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_3/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0589255653321743
      }
    }
  }
}
node {
  name: "conv2d_3/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0589255653321743
      }
    }
  }
}
node {
  name: "conv2d_3/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "conv2d_3/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 1491906
    }
  }
}
node {
  name: "conv2d_3/random_uniform/sub"
  op: "Sub"
  input: "conv2d_3/random_uniform/max"
  input: "conv2d_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_3/random_uniform/mul"
  op: "Mul"
  input: "conv2d_3/random_uniform/RandomUniform"
  input: "conv2d_3/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_3/random_uniform"
  op: "Add"
  input: "conv2d_3/random_uniform/mul"
  input: "conv2d_3/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "conv2d_3/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_3/kernel/Assign"
  op: "Assign"
  input: "conv2d_3/kernel"
  input: "conv2d_3/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_3/kernel/read"
  op: "Identity"
  input: "conv2d_3/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/kernel"
      }
    }
  }
}
node {
  name: "conv2d_3/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "conv2d_3/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "conv2d_3/bias/Assign"
  op: "Assign"
  input: "conv2d_3/bias"
  input: "conv2d_3/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_3/bias/read"
  op: "Identity"
  input: "conv2d_3/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/bias"
      }
    }
  }
}
node {
  name: "conv2d_3/convolution/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_3/convolution/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "conv2d_3/convolution"
  op: "Conv2D"
  input: "max_pooling2d_2/MaxPool"
  input: "conv2d_3/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "conv2d_3/BiasAdd"
  op: "BiasAdd"
  input: "conv2d_3/convolution"
  input: "conv2d_3/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "activation_3/Relu"
  op: "Relu"
  input: "conv2d_3/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "max_pooling2d_3/MaxPool"
  op: "MaxPool"
  input: "activation_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
}
node {
  name: "flatten_1/Shape"
  op: "Shape"
  input: "max_pooling2d_3/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "flatten_1/strided_slice/stack"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1/strided_slice/stack_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1/strided_slice/stack_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "flatten_1/strided_slice"
  op: "StridedSlice"
  input: "flatten_1/Shape"
  input: "flatten_1/strided_slice/stack"
  input: "flatten_1/strided_slice/stack_1"
  input: "flatten_1/strided_slice/stack_2"
  attr {
    key: "Index"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "begin_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "ellipsis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "end_mask"
    value {
      i: 1
    }
  }
  attr {
    key: "new_axis_mask"
    value {
      i: 0
    }
  }
  attr {
    key: "shrink_axis_mask"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "flatten_1/Prod"
  op: "Prod"
  input: "flatten_1/strided_slice"
  input: "flatten_1/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "flatten_1/stack/0"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "flatten_1/stack"
  op: "Pack"
  input: "flatten_1/stack/0"
  input: "flatten_1/Prod"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "axis"
    value {
      i: 0
    }
  }
}
node {
  name: "flatten_1/Reshape"
  op: "Reshape"
  input: "max_pooling2d_3/MaxPool"
  input: "flatten_1/stack"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "dense_1/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\000\260\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "dense_1/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.011523470282554626
      }
    }
  }
}
node {
  name: "dense_1/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.011523470282554626
      }
    }
  }
}
node {
  name: "dense_1/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_1/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 9141207
    }
  }
}
node {
  name: "dense_1/random_uniform/sub"
  op: "Sub"
  input: "dense_1/random_uniform/max"
  input: "dense_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/random_uniform/mul"
  op: "Mul"
  input: "dense_1/random_uniform/RandomUniform"
  input: "dense_1/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/random_uniform"
  op: "Add"
  input: "dense_1/random_uniform/mul"
  input: "dense_1/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_1/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 45056
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1/kernel/Assign"
  op: "Assign"
  input: "dense_1/kernel"
  input: "dense_1/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1/kernel/read"
  op: "Identity"
  input: "dense_1/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
}
node {
  name: "dense_1/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_1/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_1/bias/Assign"
  op: "Assign"
  input: "dense_1/bias"
  input: "dense_1/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_1/bias/read"
  op: "Identity"
  input: "dense_1/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
}
node {
  name: "dense_1/MatMul"
  op: "MatMul"
  input: "flatten_1/Reshape"
  input: "dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_1/BiasAdd"
  op: "BiasAdd"
  input: "dense_1/MatMul"
  input: "dense_1/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "activation_4/Relu"
  op: "Relu"
  input: "dense_1/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dropout_1/Identity"
  op: "Identity"
  input: "activation_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/random_uniform/shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\200\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "dense_2/random_uniform/min"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.2156655490398407
      }
    }
  }
}
node {
  name: "dense_2/random_uniform/max"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.2156655490398407
      }
    }
  }
}
node {
  name: "dense_2/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "dense_2/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 87654321
    }
  }
  attr {
    key: "seed2"
    value {
      i: 8414717
    }
  }
}
node {
  name: "dense_2/random_uniform/sub"
  op: "Sub"
  input: "dense_2/random_uniform/max"
  input: "dense_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/random_uniform/mul"
  op: "Mul"
  input: "dense_2/random_uniform/RandomUniform"
  input: "dense_2/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/random_uniform"
  op: "Add"
  input: "dense_2/random_uniform/mul"
  input: "dense_2/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "dense_2/kernel"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2/kernel/Assign"
  op: "Assign"
  input: "dense_2/kernel"
  input: "dense_2/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2/kernel/read"
  op: "Identity"
  input: "dense_2/kernel"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
}
node {
  name: "dense_2/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "dense_2/bias"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "dense_2/bias/Assign"
  op: "Assign"
  input: "dense_2/bias"
  input: "dense_2/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "dense_2/bias/read"
  op: "Identity"
  input: "dense_2/bias"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
}
node {
  name: "dense_2/MatMul"
  op: "MatMul"
  input: "dropout_1/Identity"
  input: "dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "dense_2/BiasAdd"
  op: "BiasAdd"
  input: "dense_2/MatMul"
  input: "dense_2/bias/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "activation_5/Sigmoid"
  op: "Sigmoid"
  input: "dense_2/BiasAdd"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Placeholder"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "Placeholder"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_1"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_1"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "Placeholder_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_2"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_2"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "Placeholder_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_3"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_3"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "Placeholder_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_4"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_4"
  op: "Assign"
  input: "conv2d_3/kernel"
  input: "Placeholder_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_5"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_5"
  op: "Assign"
  input: "conv2d_3/bias"
  input: "Placeholder_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_6"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 45056
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_6"
  op: "Assign"
  input: "dense_1/kernel"
  input: "Placeholder_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_7"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_7"
  op: "Assign"
  input: "dense_1/bias"
  input: "Placeholder_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_8"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Assign_8"
  op: "Assign"
  input: "dense_2/kernel"
  input: "Placeholder_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_9"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Assign_9"
  op: "Assign"
  input: "dense_2/bias"
  input: "Placeholder_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "init"
  op: "NoOp"
  input: "^conv2d_1/kernel/Assign"
  input: "^conv2d_1/bias/Assign"
  input: "^conv2d_2/kernel/Assign"
  input: "^conv2d_2/bias/Assign"
  input: "^conv2d_3/kernel/Assign"
  input: "^conv2d_3/bias/Assign"
  input: "^dense_1/kernel/Assign"
  input: "^dense_1/bias/Assign"
  input: "^dense_2/kernel/Assign"
  input: "^dense_2/bias/Assign"
}
node {
  name: "SGD/iterations/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 0
      }
    }
  }
}
node {
  name: "SGD/iterations"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SGD/iterations/Assign"
  op: "Assign"
  input: "SGD/iterations"
  input: "SGD/iterations/initial_value"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SGD/iterations/read"
  op: "Identity"
  input: "SGD/iterations"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/iterations"
      }
    }
  }
}
node {
  name: "SGD/lr/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.003000000026077032
      }
    }
  }
}
node {
  name: "SGD/lr"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SGD/lr/Assign"
  op: "Assign"
  input: "SGD/lr"
  input: "SGD/lr/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/lr"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SGD/lr/read"
  op: "Identity"
  input: "SGD/lr"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/lr"
      }
    }
  }
}
node {
  name: "SGD/momentum/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.8999999761581421
      }
    }
  }
}
node {
  name: "SGD/momentum"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SGD/momentum/Assign"
  op: "Assign"
  input: "SGD/momentum"
  input: "SGD/momentum/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/momentum"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SGD/momentum/read"
  op: "Identity"
  input: "SGD/momentum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/momentum"
      }
    }
  }
}
node {
  name: "SGD/decay/initial_value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 9.999999974752427e-07
      }
    }
  }
}
node {
  name: "SGD/decay"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "SGD/decay/Assign"
  op: "Assign"
  input: "SGD/decay"
  input: "SGD/decay/initial_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/decay"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "SGD/decay/read"
  op: "Identity"
  input: "SGD/decay"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/decay"
      }
    }
  }
}
node {
  name: "activation_5_target"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "activation_5_sample_weights"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0000000116860974e-07
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/sub/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/sub"
  op: "Sub"
  input: "loss/activation_5_loss/sub/x"
  input: "loss/activation_5_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/clip_by_value/Minimum"
  op: "Minimum"
  input: "activation_5/Sigmoid"
  input: "loss/activation_5_loss/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/clip_by_value"
  op: "Maximum"
  input: "loss/activation_5_loss/clip_by_value/Minimum"
  input: "loss/activation_5_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/sub_1/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/sub_1"
  op: "Sub"
  input: "loss/activation_5_loss/sub_1/x"
  input: "loss/activation_5_loss/clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/truediv"
  op: "RealDiv"
  input: "loss/activation_5_loss/clip_by_value"
  input: "loss/activation_5_loss/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/Log"
  op: "Log"
  input: "loss/activation_5_loss/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/zeros_like"
  op: "ZerosLike"
  input: "loss/activation_5_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  op: "GreaterEqual"
  input: "loss/activation_5_loss/Log"
  input: "loss/activation_5_loss/logistic_loss/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/Select"
  op: "Select"
  input: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  input: "loss/activation_5_loss/Log"
  input: "loss/activation_5_loss/logistic_loss/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/Neg"
  op: "Neg"
  input: "loss/activation_5_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/Select_1"
  op: "Select"
  input: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  input: "loss/activation_5_loss/logistic_loss/Neg"
  input: "loss/activation_5_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/mul"
  op: "Mul"
  input: "loss/activation_5_loss/Log"
  input: "activation_5_target"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/sub"
  op: "Sub"
  input: "loss/activation_5_loss/logistic_loss/Select"
  input: "loss/activation_5_loss/logistic_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/Exp"
  op: "Exp"
  input: "loss/activation_5_loss/logistic_loss/Select_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss/Log1p"
  op: "Log1p"
  input: "loss/activation_5_loss/logistic_loss/Exp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/logistic_loss"
  op: "Add"
  input: "loss/activation_5_loss/logistic_loss/sub"
  input: "loss/activation_5_loss/logistic_loss/Log1p"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/Mean"
  op: "Mean"
  input: "loss/activation_5_loss/logistic_loss"
  input: "loss/activation_5_loss/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/activation_5_loss/Mean_1/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/Mean_1"
  op: "Mean"
  input: "loss/activation_5_loss/Mean"
  input: "loss/activation_5_loss/Mean_1/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/activation_5_loss/mul"
  op: "Mul"
  input: "loss/activation_5_loss/Mean_1"
  input: "activation_5_sample_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/NotEqual/y"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/NotEqual"
  op: "NotEqual"
  input: "activation_5_sample_weights"
  input: "loss/activation_5_loss/NotEqual/y"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/Cast"
  op: "Cast"
  input: "loss/activation_5_loss/NotEqual"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "loss/activation_5_loss/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/Mean_2"
  op: "Mean"
  input: "loss/activation_5_loss/Cast"
  input: "loss/activation_5_loss/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/activation_5_loss/truediv_1"
  op: "RealDiv"
  input: "loss/activation_5_loss/mul"
  input: "loss/activation_5_loss/Mean_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "loss/activation_5_loss/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "loss/activation_5_loss/Mean_3"
  op: "Mean"
  input: "loss/activation_5_loss/truediv_1"
  input: "loss/activation_5_loss/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "loss/mul/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "loss/mul"
  op: "Mul"
  input: "loss/mul/x"
  input: "loss/activation_5_loss/Mean_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/acc/Round"
  op: "Round"
  input: "activation_5/Sigmoid"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/acc/Equal"
  op: "Equal"
  input: "activation_5_target"
  input: "metrics/acc/Round"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "metrics/acc/Cast"
  op: "Cast"
  input: "metrics/acc/Equal"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_BOOL
    }
  }
}
node {
  name: "metrics/acc/Mean/reduction_indices"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: -1
      }
    }
  }
}
node {
  name: "metrics/acc/Mean"
  op: "Mean"
  input: "metrics/acc/Cast"
  input: "metrics/acc/Mean/reduction_indices"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "metrics/acc/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "metrics/acc/Mean_1"
  op: "Mean"
  input: "metrics/acc/Mean"
  input: "metrics/acc/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/Fill"
  op: "Fill"
  input: "training/SGD/gradients/Shape"
  input: "training/SGD/gradients/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/mul_grad/Shape"
  input: "training/SGD/gradients/loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/Fill"
  input: "loss/activation_5_loss/Mean_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/mul_grad/mul"
  input: "training/SGD/gradients/loss/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/mul_grad/Sum"
  input: "training/SGD/gradients/loss/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/mul_1"
  op: "Mul"
  input: "loss/mul/x"
  input: "training/SGD/gradients/Fill"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/mul_grad/mul_1"
  input: "training/SGD/gradients/loss/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/mul_grad/Sum_1"
  input: "training/SGD/gradients/loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Reshape/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/mul_grad/Reshape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Reshape/shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/truediv_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Tile"
  op: "Tile"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Shape_1"
  op: "Shape"
  input: "loss/activation_5_loss/truediv_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Shape_2"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Prod"
  op: "Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Shape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Const_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Prod_1"
  op: "Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Shape_2"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Maximum"
  op: "Maximum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Prod_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/floordiv"
  op: "FloorDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Cast"
  op: "Cast"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/floordiv"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/truediv"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Tile"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_3"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/RealDiv"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/truediv"
  input: "loss/activation_5_loss/Mean_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Neg"
  op: "Neg"
  input: "loss/activation_5_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/RealDiv_1"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Neg"
  input: "loss/activation_5_loss/Mean_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/RealDiv_2"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/RealDiv_1"
  input: "loss/activation_5_loss/Mean_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_3_grad/truediv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/mul"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Shape_1"
  op: "Shape"
  input: "activation_5_sample_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Reshape"
  input: "activation_5_sample_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/mul"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/mul_1"
  op: "Mul"
  input: "loss/activation_5_loss/Mean_1"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_1_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/mul_1"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/add"
  op: "Add"
  input: "loss/activation_5_loss/Mean_1/reduction_indices"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/mod"
  op: "FloorMod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/add"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/range"
  op: "Range"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/range/start"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Size"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Fill"
  op: "Fill"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/range"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/mod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum"
  op: "Maximum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/DynamicStitch"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/floordiv"
  op: "FloorDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/mul_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Tile"
  op: "Tile"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape_2"
  op: "Shape"
  input: "loss/activation_5_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape_3"
  op: "Shape"
  input: "loss/activation_5_loss/Mean_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Prod"
  op: "Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape_2"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Const_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Prod_1"
  op: "Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Shape_3"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum_1"
  op: "Maximum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Prod_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/floordiv_1"
  op: "FloorDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Cast"
  op: "Cast"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/truediv"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Tile"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/logistic_loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Size"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 2
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/add"
  op: "Add"
  input: "loss/activation_5_loss/Mean/reduction_indices"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/mod"
  op: "FloorMod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/add"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Size"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/range/start"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/range/delta"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/range"
  op: "Range"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/range/start"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Size"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/range/delta"
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Fill/value"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Fill"
  op: "Fill"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Fill/value"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/DynamicStitch"
  op: "DynamicStitch"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/range"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/mod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Fill"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum"
  op: "Maximum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/DynamicStitch"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/floordiv"
  op: "FloorDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_1_grad/truediv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/DynamicStitch"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Tile"
  op: "Tile"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/floordiv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tmultiples"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape_2"
  op: "Shape"
  input: "loss/activation_5_loss/logistic_loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape_3"
  op: "Shape"
  input: "loss/activation_5_loss/Mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Prod"
  op: "Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape_2"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Const"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Const_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 1
          }
        }
        int_val: 0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Prod_1"
  op: "Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Shape_3"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Const_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum_1/y"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum_1"
  op: "Maximum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Prod_1"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum_1/y"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/floordiv_1"
  op: "FloorDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Prod"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Maximum_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Cast"
  op: "Cast"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/floordiv_1"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/truediv"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Tile"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Mean"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/logistic_loss/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Shape_1"
  op: "Shape"
  input: "loss/activation_5_loss/logistic_loss/Log1p"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/truediv"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/Mean_grad/truediv"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/logistic_loss/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Shape_1"
  op: "Shape"
  input: "loss/activation_5_loss/logistic_loss/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Neg"
  op: "Neg"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Neg"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/sub"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/add/x"
  op: "Const"
  input: "^training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Reshape_1"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Log1p"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/add"
  op: "Add"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/add/x"
  input: "loss/activation_5_loss/logistic_loss/Exp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Log1p"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/Reciprocal"
  op: "Reciprocal"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Log1p"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss_grad/Reshape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/Reciprocal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Log1p"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_grad/zeros_like"
  op: "ZerosLike"
  input: "loss/activation_5_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_grad/Select"
  op: "Select"
  input: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_grad/Select_1"
  op: "Select"
  input: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_grad/zeros_like"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/Log"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Shape_1"
  op: "Shape"
  input: "activation_5_target"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Reshape_1"
  input: "activation_5_target"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/mul"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/mul_1"
  op: "Mul"
  input: "loss/activation_5_loss/Log"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/sub_grad/Reshape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/mul_1"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/mul"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Exp_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Log1p_grad/mul"
  input: "loss/activation_5_loss/logistic_loss/Exp"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Exp"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/zeros_like"
  op: "ZerosLike"
  input: "loss/activation_5_loss/logistic_loss/Neg"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/Select"
  op: "Select"
  input: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Exp_grad/mul"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/zeros_like"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/Select_1"
  op: "Select"
  input: "loss/activation_5_loss/logistic_loss/GreaterEqual"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/zeros_like"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Exp_grad/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Neg_grad/Neg"
  op: "Neg"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/Select"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Neg"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/AddN"
  op: "AddN"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_grad/Select"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/mul_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Select_1_grad/Select_1"
  input: "training/SGD/gradients/loss/activation_5_loss/logistic_loss/Neg_grad/Neg"
  attr {
    key: "N"
    value {
      i: 4
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/logistic_loss/Select"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Log_grad/Reciprocal"
  op: "Reciprocal"
  input: "loss/activation_5_loss/truediv"
  input: "^training/SGD/gradients/AddN"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Log"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/Log_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/AddN"
  input: "training/SGD/gradients/loss/activation_5_loss/Log_grad/Reciprocal"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/Log"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Shape_1"
  op: "Shape"
  input: "loss/activation_5_loss/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/RealDiv"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/Log_grad/mul"
  input: "loss/activation_5_loss/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Neg"
  op: "Neg"
  input: "loss/activation_5_loss/clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/RealDiv_1"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Neg"
  input: "loss/activation_5_loss/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/RealDiv_2"
  op: "RealDiv"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/RealDiv_1"
  input: "loss/activation_5_loss/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/mul"
  op: "Mul"
  input: "training/SGD/gradients/loss/activation_5_loss/Log_grad/mul"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/RealDiv_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/mul"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Shape_1"
  op: "Shape"
  input: "loss/activation_5_loss/clip_by_value"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Reshape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Reshape_1"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Neg"
  op: "Neg"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Sum_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Neg"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/sub_1"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/AddN_1"
  op: "AddN"
  input: "training/SGD/gradients/loss/activation_5_loss/truediv_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/sub_1_grad/Reshape_1"
  attr {
    key: "N"
    value {
      i: 2
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/truediv"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape"
  op: "Shape"
  input: "loss/activation_5_loss/clip_by_value/Minimum"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape_2"
  op: "Shape"
  input: "training/SGD/gradients/AddN_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/zeros"
  op: "Fill"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape_2"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/GreaterEqual"
  op: "GreaterEqual"
  input: "loss/activation_5_loss/clip_by_value/Minimum"
  input: "loss/activation_5_loss/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Select"
  op: "Select"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/GreaterEqual"
  input: "training/SGD/gradients/AddN_1"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/LogicalNot"
  op: "LogicalNot"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/GreaterEqual"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Select_1"
  op: "Select"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/LogicalNot"
  input: "training/SGD/gradients/AddN_1"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Select"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Select_1"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape"
  op: "Shape"
  input: "activation_5/Sigmoid"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
          }
        }
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape_2"
  op: "Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/zeros/Const"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/zeros"
  op: "Fill"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape_2"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/zeros/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/LessEqual"
  op: "LessEqual"
  input: "activation_5/Sigmoid"
  input: "loss/activation_5_loss/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs"
  op: "BroadcastGradientArgs"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Select"
  op: "Select"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/LessEqual"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/LogicalNot"
  op: "LogicalNot"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/LessEqual"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Select_1"
  op: "Select"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/LogicalNot"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value_grad/Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Sum"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Select"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Sum_1"
  op: "Sum"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Select_1"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/BroadcastGradientArgs:1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
  attr {
    key: "keep_dims"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Reshape_1"
  op: "Reshape"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Sum_1"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Shape_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@loss/activation_5_loss/clip_by_value/Minimum"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/activation_5/Sigmoid_grad/SigmoidGrad"
  op: "SigmoidGrad"
  input: "activation_5/Sigmoid"
  input: "training/SGD/gradients/loss/activation_5_loss/clip_by_value/Minimum_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@activation_5/Sigmoid"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/dense_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/SGD/gradients/activation_5/Sigmoid_grad/SigmoidGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/SGD/gradients/dense_2/MatMul_grad/MatMul"
  op: "MatMul"
  input: "training/SGD/gradients/activation_5/Sigmoid_grad/SigmoidGrad"
  input: "dense_2/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/dense_2/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "dropout_1/Identity"
  input: "training/SGD/gradients/activation_5/Sigmoid_grad/SigmoidGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/activation_4/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/SGD/gradients/dense_2/MatMul_grad/MatMul"
  input: "activation_4/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@activation_4/Relu"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/SGD/gradients/activation_4/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/SGD/gradients/dense_1/MatMul_grad/MatMul"
  op: "MatMul"
  input: "training/SGD/gradients/activation_4/Relu_grad/ReluGrad"
  input: "dense_1/kernel/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: false
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/dense_1/MatMul_grad/MatMul_1"
  op: "MatMul"
  input: "flatten_1/Reshape"
  input: "training/SGD/gradients/activation_4/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/MatMul"
      }
    }
  }
  attr {
    key: "transpose_a"
    value {
      b: true
    }
  }
  attr {
    key: "transpose_b"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/gradients/flatten_1/Reshape_grad/Shape"
  op: "Shape"
  input: "max_pooling2d_3/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@flatten_1/Reshape"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/flatten_1/Reshape_grad/Reshape"
  op: "Reshape"
  input: "training/SGD/gradients/dense_1/MatMul_grad/MatMul"
  input: "training/SGD/gradients/flatten_1/Reshape_grad/Shape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tshape"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@flatten_1/Reshape"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/max_pooling2d_3/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "activation_3/Relu"
  input: "max_pooling2d_3/MaxPool"
  input: "training/SGD/gradients/flatten_1/Reshape_grad/Reshape"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_3/MaxPool"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/activation_3/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/SGD/gradients/max_pooling2d_3/MaxPool_grad/MaxPoolGrad"
  input: "activation_3/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@activation_3/Relu"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_3/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/SGD/gradients/activation_3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_3/convolution_grad/Shape"
  op: "Shape"
  input: "max_pooling2d_2/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/convolution"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_3/convolution_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "training/SGD/gradients/conv2d_3/convolution_grad/Shape"
  input: "conv2d_3/kernel/read"
  input: "training/SGD/gradients/activation_3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_3/convolution_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/convolution"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\200\000\000\000"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_3/convolution_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "max_pooling2d_2/MaxPool"
  input: "training/SGD/gradients/conv2d_3/convolution_grad/Shape_1"
  input: "training/SGD/gradients/activation_3/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/max_pooling2d_2/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "activation_2/Relu"
  input: "max_pooling2d_2/MaxPool"
  input: "training/SGD/gradients/conv2d_3/convolution_grad/Conv2DBackpropInput"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_2/MaxPool"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/activation_2/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/SGD/gradients/max_pooling2d_2/MaxPool_grad/MaxPoolGrad"
  input: "activation_2/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@activation_2/Relu"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_2/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/SGD/gradients/activation_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_2/convolution_grad/Shape"
  op: "Shape"
  input: "max_pooling2d_1/MaxPool"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_2/convolution_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "training/SGD/gradients/conv2d_2/convolution_grad/Shape"
  input: "conv2d_2/kernel/read"
  input: "training/SGD/gradients/activation_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_2/convolution_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000 \000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "max_pooling2d_1/MaxPool"
  input: "training/SGD/gradients/conv2d_2/convolution_grad/Shape_1"
  input: "training/SGD/gradients/activation_2/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGrad"
  op: "MaxPoolGrad"
  input: "activation_1/Relu"
  input: "max_pooling2d_1/MaxPool"
  input: "training/SGD/gradients/conv2d_2/convolution_grad/Conv2DBackpropInput"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@max_pooling2d_1/MaxPool"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 3
        i: 3
        i: 1
      }
    }
  }
}
node {
  name: "training/SGD/gradients/activation_1/Relu_grad/ReluGrad"
  op: "ReluGrad"
  input: "training/SGD/gradients/max_pooling2d_1/MaxPool_grad/MaxPoolGrad"
  input: "activation_1/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@activation_1/Relu"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad"
  op: "BiasAddGrad"
  input: "training/SGD/gradients/activation_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/BiasAdd"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_1/convolution_grad/Shape"
  op: "Shape"
  input: "conv2d_1_input"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "out_type"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_1/convolution_grad/Conv2DBackpropInput"
  op: "Conv2DBackpropInput"
  input: "training/SGD/gradients/conv2d_1/convolution_grad/Shape"
  input: "conv2d_1/kernel/read"
  input: "training/SGD/gradients/activation_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_1/convolution_grad/Shape_1"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\001\000\000\000 \000\000\000"
      }
    }
  }
}
node {
  name: "training/SGD/gradients/conv2d_1/convolution_grad/Conv2DBackpropFilter"
  op: "Conv2DBackpropFilter"
  input: "conv2d_1_input"
  input: "training/SGD/gradients/conv2d_1/convolution_grad/Shape_1"
  input: "training/SGD/gradients/activation_1/Relu_grad/ReluGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/convolution"
      }
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "VALID"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/AssignAdd/value"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT64
        tensor_shape {
        }
        int64_val: 1
      }
    }
  }
}
node {
  name: "training/SGD/AssignAdd"
  op: "AssignAdd"
  input: "SGD/iterations"
  input: "training/SGD/AssignAdd/value"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
}
node {
  name: "training/SGD/Cast"
  op: "Cast"
  input: "SGD/iterations/read"
  attr {
    key: "DstT"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "SrcT"
    value {
      type: DT_INT64
    }
  }
}
node {
  name: "training/SGD/mul"
  op: "Mul"
  input: "SGD/decay/read"
  input: "training/SGD/Cast"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "training/SGD/add"
  op: "Add"
  input: "training/SGD/add/x"
  input: "training/SGD/mul"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/truediv/x"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "training/SGD/truediv"
  op: "RealDiv"
  input: "training/SGD/truediv/x"
  input: "training/SGD/add"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_1"
  op: "Mul"
  input: "SGD/lr/read"
  input: "training/SGD/truediv"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 1
          }
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable/Assign"
  op: "Assign"
  input: "training/SGD/Variable"
  input: "training/SGD/Const"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable/read"
  op: "Identity"
  input: "training/SGD/Variable"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable"
      }
    }
  }
}
node {
  name: "training/SGD/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 32
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_1"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_1/Assign"
  op: "Assign"
  input: "training/SGD/Variable_1"
  input: "training/SGD/Const_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_1/read"
  op: "Identity"
  input: "training/SGD/Variable_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_1"
      }
    }
  }
}
node {
  name: "training/SGD/Const_2"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 32
          }
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_2"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_2/Assign"
  op: "Assign"
  input: "training/SGD/Variable_2"
  input: "training/SGD/Const_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_2/read"
  op: "Identity"
  input: "training/SGD/Variable_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_2"
      }
    }
  }
}
node {
  name: "training/SGD/Const_3"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_3"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_3/Assign"
  op: "Assign"
  input: "training/SGD/Variable_3"
  input: "training/SGD/Const_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_3/read"
  op: "Identity"
  input: "training/SGD/Variable_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_3"
      }
    }
  }
}
node {
  name: "training/SGD/Const_4"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 3
          }
          dim {
            size: 3
          }
          dim {
            size: 64
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_4"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_4/Assign"
  op: "Assign"
  input: "training/SGD/Variable_4"
  input: "training/SGD/Const_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_4/read"
  op: "Identity"
  input: "training/SGD/Variable_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_4"
      }
    }
  }
}
node {
  name: "training/SGD/Const_5"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_5"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_5/Assign"
  op: "Assign"
  input: "training/SGD/Variable_5"
  input: "training/SGD/Const_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_5/read"
  op: "Identity"
  input: "training/SGD/Variable_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_5"
      }
    }
  }
}
node {
  name: "training/SGD/Const_6"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 45056
          }
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_6"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 45056
        }
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_6/Assign"
  op: "Assign"
  input: "training/SGD/Variable_6"
  input: "training/SGD/Const_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_6/read"
  op: "Identity"
  input: "training/SGD/Variable_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_6"
      }
    }
  }
}
node {
  name: "training/SGD/Const_7"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_7"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_7/Assign"
  op: "Assign"
  input: "training/SGD/Variable_7"
  input: "training/SGD/Const_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_7/read"
  op: "Identity"
  input: "training/SGD/Variable_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_7"
      }
    }
  }
}
node {
  name: "training/SGD/Const_8"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 128
          }
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_8"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_8/Assign"
  op: "Assign"
  input: "training/SGD/Variable_8"
  input: "training/SGD/Const_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_8/read"
  op: "Identity"
  input: "training/SGD/Variable_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_8"
      }
    }
  }
}
node {
  name: "training/SGD/Const_9"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 1
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "training/SGD/Variable_9"
  op: "VariableV2"
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "training/SGD/Variable_9/Assign"
  op: "Assign"
  input: "training/SGD/Variable_9"
  input: "training/SGD/Const_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/Variable_9/read"
  op: "Identity"
  input: "training/SGD/Variable_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_9"
      }
    }
  }
}
node {
  name: "training/SGD/mul_2"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_3"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_1/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub"
  op: "Sub"
  input: "training/SGD/mul_2"
  input: "training/SGD/mul_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign"
  op: "Assign"
  input: "training/SGD/Variable"
  input: "training/SGD/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_4"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_1"
  op: "Add"
  input: "conv2d_1/kernel/read"
  input: "training/SGD/mul_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_5"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_1/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_1"
  op: "Sub"
  input: "training/SGD/add_1"
  input: "training/SGD/mul_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_1"
  op: "Assign"
  input: "conv2d_1/kernel"
  input: "training/SGD/sub_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_6"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_1/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_7"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_2"
  op: "Sub"
  input: "training/SGD/mul_6"
  input: "training/SGD/mul_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_2"
  op: "Assign"
  input: "training/SGD/Variable_1"
  input: "training/SGD/sub_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_8"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_2"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_2"
  op: "Add"
  input: "conv2d_1/bias/read"
  input: "training/SGD/mul_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_9"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_1/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_3"
  op: "Sub"
  input: "training/SGD/add_2"
  input: "training/SGD/mul_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_3"
  op: "Assign"
  input: "conv2d_1/bias"
  input: "training/SGD/sub_3"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_10"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_2/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_11"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_4"
  op: "Sub"
  input: "training/SGD/mul_10"
  input: "training/SGD/mul_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_4"
  op: "Assign"
  input: "training/SGD/Variable_2"
  input: "training/SGD/sub_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_12"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_4"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_3"
  op: "Add"
  input: "conv2d_2/kernel/read"
  input: "training/SGD/mul_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_13"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_2/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_5"
  op: "Sub"
  input: "training/SGD/add_3"
  input: "training/SGD/mul_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_5"
  op: "Assign"
  input: "conv2d_2/kernel"
  input: "training/SGD/sub_5"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_14"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_3/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_15"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_2/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_6"
  op: "Sub"
  input: "training/SGD/mul_14"
  input: "training/SGD/mul_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_6"
  op: "Assign"
  input: "training/SGD/Variable_3"
  input: "training/SGD/sub_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_16"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_6"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_4"
  op: "Add"
  input: "conv2d_2/bias/read"
  input: "training/SGD/mul_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_17"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_2/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_7"
  op: "Sub"
  input: "training/SGD/add_4"
  input: "training/SGD/mul_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_7"
  op: "Assign"
  input: "conv2d_2/bias"
  input: "training/SGD/sub_7"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_18"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_4/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_19"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_3/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_8"
  op: "Sub"
  input: "training/SGD/mul_18"
  input: "training/SGD/mul_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_8"
  op: "Assign"
  input: "training/SGD/Variable_4"
  input: "training/SGD/sub_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_20"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_8"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_5"
  op: "Add"
  input: "conv2d_3/kernel/read"
  input: "training/SGD/mul_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_21"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_3/convolution_grad/Conv2DBackpropFilter"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_9"
  op: "Sub"
  input: "training/SGD/add_5"
  input: "training/SGD/mul_21"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_9"
  op: "Assign"
  input: "conv2d_3/kernel"
  input: "training/SGD/sub_9"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_22"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_5/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_23"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_3/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_10"
  op: "Sub"
  input: "training/SGD/mul_22"
  input: "training/SGD/mul_23"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_10"
  op: "Assign"
  input: "training/SGD/Variable_5"
  input: "training/SGD/sub_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_24"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_10"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_6"
  op: "Add"
  input: "conv2d_3/bias/read"
  input: "training/SGD/mul_24"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_25"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/conv2d_3/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_11"
  op: "Sub"
  input: "training/SGD/add_6"
  input: "training/SGD/mul_25"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_11"
  op: "Assign"
  input: "conv2d_3/bias"
  input: "training/SGD/sub_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@conv2d_3/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_26"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_6/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_27"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_1/MatMul_grad/MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_12"
  op: "Sub"
  input: "training/SGD/mul_26"
  input: "training/SGD/mul_27"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_12"
  op: "Assign"
  input: "training/SGD/Variable_6"
  input: "training/SGD/sub_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_28"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_7"
  op: "Add"
  input: "dense_1/kernel/read"
  input: "training/SGD/mul_28"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_29"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_1/MatMul_grad/MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_13"
  op: "Sub"
  input: "training/SGD/add_7"
  input: "training/SGD/mul_29"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_13"
  op: "Assign"
  input: "dense_1/kernel"
  input: "training/SGD/sub_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_30"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_7/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_31"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_14"
  op: "Sub"
  input: "training/SGD/mul_30"
  input: "training/SGD/mul_31"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_14"
  op: "Assign"
  input: "training/SGD/Variable_7"
  input: "training/SGD/sub_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_32"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_8"
  op: "Add"
  input: "dense_1/bias/read"
  input: "training/SGD/mul_32"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_33"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_1/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_15"
  op: "Sub"
  input: "training/SGD/add_8"
  input: "training/SGD/mul_33"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_15"
  op: "Assign"
  input: "dense_1/bias"
  input: "training/SGD/sub_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_1/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_34"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_8/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_35"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_2/MatMul_grad/MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_16"
  op: "Sub"
  input: "training/SGD/mul_34"
  input: "training/SGD/mul_35"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_16"
  op: "Assign"
  input: "training/SGD/Variable_8"
  input: "training/SGD/sub_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_36"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_9"
  op: "Add"
  input: "dense_2/kernel/read"
  input: "training/SGD/mul_36"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_37"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_2/MatMul_grad/MatMul_1"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_17"
  op: "Sub"
  input: "training/SGD/add_9"
  input: "training/SGD/mul_37"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_17"
  op: "Assign"
  input: "dense_2/kernel"
  input: "training/SGD/sub_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/kernel"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_38"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/Variable_9/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_39"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_2/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_18"
  op: "Sub"
  input: "training/SGD/mul_38"
  input: "training/SGD/mul_39"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_18"
  op: "Assign"
  input: "training/SGD/Variable_9"
  input: "training/SGD/sub_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/SGD/mul_40"
  op: "Mul"
  input: "SGD/momentum/read"
  input: "training/SGD/sub_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/add_10"
  op: "Add"
  input: "dense_2/bias/read"
  input: "training/SGD/mul_40"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/mul_41"
  op: "Mul"
  input: "training/SGD/mul_1"
  input: "training/SGD/gradients/dense_2/BiasAdd_grad/BiasAddGrad"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/sub_19"
  op: "Sub"
  input: "training/SGD/add_10"
  input: "training/SGD/mul_41"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "training/SGD/Assign_19"
  op: "Assign"
  input: "dense_2/bias"
  input: "training/SGD/sub_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@dense_2/bias"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "training/group_deps"
  op: "NoOp"
  input: "^loss/mul"
  input: "^metrics/acc/Mean_1"
  input: "^training/SGD/AssignAdd"
  input: "^training/SGD/Assign"
  input: "^training/SGD/Assign_1"
  input: "^training/SGD/Assign_2"
  input: "^training/SGD/Assign_3"
  input: "^training/SGD/Assign_4"
  input: "^training/SGD/Assign_5"
  input: "^training/SGD/Assign_6"
  input: "^training/SGD/Assign_7"
  input: "^training/SGD/Assign_8"
  input: "^training/SGD/Assign_9"
  input: "^training/SGD/Assign_10"
  input: "^training/SGD/Assign_11"
  input: "^training/SGD/Assign_12"
  input: "^training/SGD/Assign_13"
  input: "^training/SGD/Assign_14"
  input: "^training/SGD/Assign_15"
  input: "^training/SGD/Assign_16"
  input: "^training/SGD/Assign_17"
  input: "^training/SGD/Assign_18"
  input: "^training/SGD/Assign_19"
}
node {
  name: "init_1"
  op: "NoOp"
  input: "^SGD/iterations/Assign"
  input: "^SGD/lr/Assign"
  input: "^SGD/momentum/Assign"
  input: "^SGD/decay/Assign"
  input: "^training/SGD/Variable/Assign"
  input: "^training/SGD/Variable_1/Assign"
  input: "^training/SGD/Variable_2/Assign"
  input: "^training/SGD/Variable_3/Assign"
  input: "^training/SGD/Variable_4/Assign"
  input: "^training/SGD/Variable_5/Assign"
  input: "^training/SGD/Variable_6/Assign"
  input: "^training/SGD/Variable_7/Assign"
  input: "^training/SGD/Variable_8/Assign"
  input: "^training/SGD/Variable_9/Assign"
}
node {
  name: "Placeholder_10"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "Assign_10"
  op: "Assign"
  input: "SGD/iterations"
  input: "Placeholder_10"
  attr {
    key: "T"
    value {
      type: DT_INT64
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@SGD/iterations"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_11"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 1
        }
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_11"
  op: "Assign"
  input: "training/SGD/Variable"
  input: "Placeholder_11"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_12"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 32
        }
      }
    }
  }
}
node {
  name: "Assign_12"
  op: "Assign"
  input: "training/SGD/Variable_1"
  input: "Placeholder_12"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_1"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_13"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 32
        }
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_13"
  op: "Assign"
  input: "training/SGD/Variable_2"
  input: "Placeholder_13"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_2"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_14"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
}
node {
  name: "Assign_14"
  op: "Assign"
  input: "training/SGD/Variable_3"
  input: "Placeholder_14"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_3"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_15"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_15"
  op: "Assign"
  input: "training/SGD/Variable_4"
  input: "Placeholder_15"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_4"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_16"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_16"
  op: "Assign"
  input: "training/SGD/Variable_5"
  input: "Placeholder_16"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_5"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_17"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 45056
        }
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_17"
  op: "Assign"
  input: "training/SGD/Variable_6"
  input: "Placeholder_17"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_6"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_18"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
      }
    }
  }
}
node {
  name: "Assign_18"
  op: "Assign"
  input: "training/SGD/Variable_7"
  input: "Placeholder_18"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_7"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_19"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 128
        }
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Assign_19"
  op: "Assign"
  input: "training/SGD/Variable_8"
  input: "Placeholder_19"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_8"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Placeholder_20"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
      }
    }
  }
}
node {
  name: "Assign_20"
  op: "Assign"
  input: "training/SGD/Variable_9"
  input: "Placeholder_20"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@training/SGD/Variable_9"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: false
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
versions {
  producer: 21
}
