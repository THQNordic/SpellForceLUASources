-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 238.688293 , 477.267975 , 51.174023 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(9964);]] )
   Camera:MotionSpline_AddSplinePoint( 236.695160 , 477.433441 , 51.174023 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 235.698914 , 477.519989 , 50.174023 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 233.705780 , 477.685455 , 49.174023 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
