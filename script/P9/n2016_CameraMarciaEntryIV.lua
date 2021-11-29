-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 366.653381 , 535.954346 , 27.849976 , 24.800058 , [[Camera:ScriptSplineLookAtNpc(2017);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.8);]] )
   Camera:MotionSpline_AddSplinePoint( 369.271667 , 534.777832 , 27.124636 , 16.500027 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 370.952484 , 532.292908 , 27.124636 , 24.700058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 372.407227 , 529.879517 , 29.124619 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
