-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 510.485107 , 306.964569 , 20.000000 , 0.000000 , [[Camera:ScriptSplineLookAtSpline();]] )
   Camera:MotionSpline_AddSplinePoint( 527.351929 , 312.889771 , 20.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 541.835999 , 322.051056 , 20.000000 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 558.061096 , 338.294678 , 20.000000 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
