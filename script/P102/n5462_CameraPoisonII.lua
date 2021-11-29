-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 231.305771 , 435.766541 , 33.478828 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(210.184,425.754,13.000);]] )
   Camera:MotionSpline_AddSplinePoint( 239.060684 , 426.689758 , 28.928831 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 247.049973 , 417.034729 , 29.748821 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 248.035309 , 407.370056 , 32.588825 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
