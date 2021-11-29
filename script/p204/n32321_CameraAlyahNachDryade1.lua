-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 230.837280 , 276.486206 , 16.180056 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(241.301,262.124,22.230);]] )
   Camera:MotionSpline_AddSplinePoint( 229.837219 , 277.483307 , 16.180056 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 229.837219 , 277.483307 , 16.180056 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 229.837219 , 277.483307 , 16.180056 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 8.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
