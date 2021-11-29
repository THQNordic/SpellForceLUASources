-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 277.675293 , 209.009689 , 16.447191 , 27.900070 , [[Camera:ScriptSplineLookAtPosition(256.510,226.229,15.571);]] )
   Camera:MotionSpline_AddSplinePoint( 252.782333 , 204.360428 , 22.187195 , 10.100002 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 227.306595 , 200.616821 , 16.277166 , 14.800020 , [[Camera:ScriptSplineLookAtPosition(239.336,224.585,15.571);]] )
   Camera:MotionSpline_AddSplinePoint( 211.054886 , 215.641464 , 22.837193 , 23.300053 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 200.795380 , 257.180939 , 13.337776 , 27.800070 , [[Camera:ScriptSplineLookAtPosition(184.086,263.046,15.571);]] )
   Camera:MotionSpline_AddSplinePoint( 216.900986 , 270.454193 , 21.173229 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 28.000000 )
   Camera:MotionSpline_SetCorrection( 0.507813 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
